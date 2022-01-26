# CheckIP

[![CI](https://github.com/checkip/checkip/workflows/CI/badge.svg?branch=main)](https://github.com/checkip/checkip/actions?query=workflow%3ACI)
[![Depfu](https://badges.depfu.com/badges/c6f8940cb635203631089a8f49a59ab0/overview.svg)](https://depfu.com/github/checkip/checkip?project_id=32130)

CheckIP is an open-source tool for IP address analysis to build your on-premise infrastructure for privacy-sensitive tasks involving IP-related data research.

## Development

Ensure your system has the Ruby version specified in the [`.ruby-version`](.ruby-version) and [Yarn v1 (classic)](https://classic.yarnpkg.com/en/docs/install).

```bash
# Clone the checkip repo
git clone git@github.com:checkip/checkip.git

# Change directory to checkip
cd checkip

# Update environment variable
cp .env.development.template .env.development

# Install Ruby dependencies
bundle install

# Install Yarn dependencies
yarn install

# Fetch mmdb files
bundle exec rake db_ip:fetch

# Run application
bin/dev
```

## License

Copyright 2020 - 2022 Dmitriy Tarasov. Released under the [BSD-3-Clause](LICENSE) license.
