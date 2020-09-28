import Config

config :ex_aws,
  json_codec: Jason,
  access_key_id: {:system, "AWS_ACCESS_KEY_ID"},
  secret_access_key: {:system, "AWS_SECRET_KEY_ID"}


  # export AWS_ACCESS_KEY_ID="........keyhere..........."
  # export AWS_SECRET_KEY_ID="........keyhere..........."
