# set the global namespace
@PIX = {}

# login tokens expire after 1 day
Accounts.config ->
  loginExpirationInDays: 1
