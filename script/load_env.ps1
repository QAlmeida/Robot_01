# Carrega variáveis do arquivo .env para a sessão atual do PowerShell (Windows)
$envPath = ".env"
if (Test-Path $envPath) {
  Get-Content $envPath | Where-Object {$_ -and $_ -notmatch '^\s*#'} | ForEach-Object {
    $parts = $_ -split '=', 2
    if ($parts.Length -eq 2) {
      $name = $parts[0].Trim()
      $value = $parts[1].Trim()
      $Env:$name = $value
    }
  }
  Write-Host "Variáveis do .env carregadas para a sessão atual."
} else {
  Write-Warning ".env não encontrado. Copie .env.example para .env e preencha as chaves."
}
