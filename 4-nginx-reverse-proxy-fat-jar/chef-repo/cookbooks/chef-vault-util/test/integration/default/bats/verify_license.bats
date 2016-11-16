@test "the license file was created" {
  ls /tmp/license.properties
}
@test "The secret file contains the secret value" {
  grep 12345 /tmp/license.properties
}
