<?php

class Credential
{
	public function __construct(
		public string $driver,
		public string $server,
		public string $username,
		public string $password,
		public string $db,
		public string $schema = '',
	) {}

	public function __toString(): string
	{
		return json_encode([
			'driver' => $this->driver,
			'server' => $this->server,
			'username' => $this->username,
			'db' => $this->db,
			'schema' => $this->schema,
		]);
	}
}

class AdminerAuthPlugin extends Adminer\Plugin
{
	/**
	 * @param Credential[] $credentials
	 */
	public function __construct(private readonly array $credentials = []){}

	public function credentials(): array
	{
		if (!empty($this->credentials) && ($credential = array_find($this->credentials, fn(Credential $credential) => $credential->server === Adminer\SERVER))) {
            $inputUsername = filter_input(INPUT_GET, 'username');
			$inputPassword = (string)Adminer\get_password();

			return [
				Adminer\SERVER,
				$inputUsername !== '' && $inputUsername !== NULL ? $inputUsername : $credential->username,
				$inputPassword !== '' ? $inputPassword : $credential->password,
			];
		}

		return [Adminer\SERVER, $_GET["username"], Adminer\get_password()];
	}

	function login(): bool {
		return true;
	}

	function loginFormField(string $name, string $heading, string $value): string
	{
		if (!empty($this->credentials) && $name == 'driver') {
			$heading .= '<select id="credential_selector">';
			foreach ($this->credentials as $credential) {
				$heading .= '<option value="' . htmlspecialchars($credential) . '">' . htmlspecialchars($credential->server) . '</option>';
			}

			$heading .= '</select><input type="hidden" name="auth[ns]" value="">';
			$nonce = Adminer\nonce();
			$heading .= <<<EOT
            <script{$nonce}>
              document.getElementById("credential_selector").addEventListener("change", function() {
                const cred = JSON.parse(this.value);
                console.log(cred);
                document.querySelector('[name="auth[driver]"]').value = cred.driver;
                document.querySelector('[name="auth[server]"]').value = cred.server;
                document.querySelector('[name="auth[username]"]').value = cred.username;
                document.querySelector('[name="auth[password]"]').value = '';
                document.querySelector('[name="auth[db]"]').value = cred.db;
                document.querySelector('[name="auth[ns]"]').value = cred.schema;
                document.querySelector('[name="auth[permanent]"]').checked = true;
              });
            </script>
            EOT;
		}
		return $heading . $value . "\n";
	}
}

$plugins = [];
// ADMINER_AUTH_PLUGIN_CREDENTIALS='[{"driver":"pgsql","server":"localhost","username":"postgres","password":"postgres","db":"postgres","schema":""}]'
if (!empty($_ENV["ADMINER_AUTH_PLUGIN_CREDENTIALS"])) {
	$plugins[] = new AdminerAuthPlugin(array_map(fn(array $cred) => new Credential($cred['driver'] ?? 'pgsql', $cred['server'] ?? 'localhost', $cred['username'] ?? 'postgres', $cred['password'] ?? 'postgres', $cred['db'] ?? 'postgres', $cred['schema'] ?? ''), json_decode($_ENV["ADMINER_AUTH_PLUGIN_CREDENTIALS"], true)));
}

return $plugins;
