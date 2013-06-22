Pony.options = {
  from: "dvc.send.email@gmail.com",
  via: :smtp,
  via_options: {
    address:              "smtp.sendgrid.net",
    port:                 "587",
    user_name:            "davincicoders",
    password:             "workQuick",
    authentication:       "plain",
    enable_starttls_auto: true,
  },
}
