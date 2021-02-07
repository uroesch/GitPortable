# Run the post-install script

$_PostInstall = "$AppDir\Git\post-install.bat"

If (Test-Path $_PostInstall) {
  Switch (Test-Unix) {
    $True   { $_Prefix = 'wine'; break }
    default { $_Prefix = '';     break }
  }
  Try {
    Debug info "Run post install command $_Prefix $_PostInstall"
    # Will always throw an error as the post-install script
    # is removing itself at the end.
    Invoke-Expression "$_Prefix $_PostInstall" 2>&1 | Out-Null
  }
  Catch {
    Debug fatal "Failed to run command $_PostInstall"
    Exit 127
  }
}
