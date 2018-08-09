# Load application configuration settings
LOCAL_ENV = YAML.load_file("#{Rails.root}/config/local_env.yml")[Rails.env]
