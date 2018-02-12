#!/usr/bin/env bash

echo "Adding Apigee access token scripts"

test_apigee() {
  acurl -h
  if [[ $? -ne 127 ]]; then
    echo "acurl command exists"
  else
    echo "acurl command does not exists"
    exit 1
  fi

  get_token -h
  if [[ $? -ne 127 ]]; then
    echo "get_token command exists"
  else
    echo "get_token command does not exists"
    exit 1
  fi

  echo "Apigee access token scripts work"
}

create_apigee() {
  mkdir /vagrant/provision/apigee
  # Go to apigee/ folder and download zip installation from Apigee
  cd /vagrant/provision/apigee || exit
  curl https://login.apigee.com/resources/scripts/sso-cli/ssocli-bundle.zip -o "ssocli-bundle.zip"
  # Unzip the downloaded file
  unzip -o ssocli-bundle.zip
  # Run the install script
  sudo ./install -b /usr/local/bin
  echo "Apigee access token scripts installed"
  # Test the acurl and get_token scripts - if there is some information and not an error, yay!
  test_apigee
}

# Check if the /apigee folder exists, if not, create it
if [[ -d "/vagrant/provision/apigee" ]]; then
  echo "/vagrant/provision/apigee folder already exists"
  rm -rf /vagrant/provision/apigee
  echo "Creating /vagrant/provision/apigee folder"
  create_apigee
else
  echo "Creating /vagrant/provision/apigee folder"
  create_apigee
fi
