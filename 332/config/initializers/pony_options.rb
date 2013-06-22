Pony.options = {
  from: "dvc.send.email@gmail.com",
  via: :smtp,
  via_options: {
    address:              "smtp.gmail.com",
    port:                 "587",
    enable_starttls_auto: true,
    user_name:            "dvc.send.email@gmail.com",
    password:             "forStudents",
    authentication:       :plain,
    domain:               "HELO",
  },
}
