# Change Log

## [v1.0.2](https://github.com/zanui/chef-thumbor/tree/v1.0.1) (2015-03-24)

[Full Changelog](https://github.com/zanui/chef-thumbor/compare/v1.0.1...v1.0.2)

**Implemented enhancements:**

- Reduce cookbook size with chefignore [\#11](https://github.com/zanui/chef-thumbor/issues/11)
- Change NGINX port from 81 to 80 to reduce JSON configuration [\#10](https://github.com/zanui/chef-thumbor/issues/10)
- Add documentation for usage with AWS OpsWorks [\#2](https://github.com/zanui/chef-thumbor/issues/2)

## [v1.0.1](https://github.com/zanui/chef-thumbor/tree/v1.0.1) (2015-03-10)

[Full Changelog](https://github.com/zanui/chef-thumbor/compare/v1.0.0...v1.0.1)

**Implemented enhancements:**

- Add serverspec tests [\#5](https://github.com/zanui/chef-thumbor/issues/5)
- Refactor "experimental" into recipes [\#1](https://github.com/zanui/chef-thumbor/issues/1)

## [v1.0.0](https://github.com/zanui/chef-thumbor/tree/v1.0.0) (2015-03-10)

[Full Changelog](https://github.com/zanui/chef-thumbor/compare/v0.4.1...v1.0.0)

**Implemented enhancements:**

- Add kitchen tests [\#6](https://github.com/zanui/chef-thumbor/issues/6)

**Closed issues:**

- add upstart custom log location capability [\#8](https://github.com/zanui/chef-thumbor/issues/8)

**Merged pull requests:**

- Refactoring [\#9](https://github.com/zanui/chef-thumbor/pull/9) ([estahn](https://github.com/estahn))
- multiple refactor changes [\#7](https://github.com/zanui/chef-thumbor/pull/7) ([vkhatri](https://github.com/vkhatri))

**Additional Information:**

- Major refactoring of the cookbook
    - *Deprecated:* "do-all" `experimental` recipe
    - Code separated into recipes
    - Add [serverspec](http://serverspec.org/) tests to validate processes are running correctly
	    - Test thumbor service `enabled`, `running`
	    - Test ports are listening via `tcp` on `9000`, `9001`, `9003`
    - Add [infrataster](http://infrataster.net/) tests to validate thumbor results are correct and installed libraries are working as expected
	    - Test `/healthcheck` responds with content `WORKING`
	    - Test `responds successfully`
	    - Test `responds as 'image/gif'`
	    - Test `responds with the correct size`
   - Add attribute `install_method` with values `package`, `pip` and `source`. This also allows to install all version and branches from any git repository such as GitHub.
   - Add monit for nginx and thumbor
   - Add redis through redisio cookbook


## [v0.4.1](https://github.com/zanui/chef-thumbor/tree/v0.4.1) (2014-09-09)

[Full Changelog](https://github.com/zanui/chef-thumbor/compare/v0.4.0...v0.4.1)

## [v0.4.0](https://github.com/zanui/chef-thumbor/tree/v0.4.0) (2014-07-23)

**Merged pull requests:**

- Remove AWS keys [\#4](https://github.com/zanui/chef-thumbor/pull/4) ([lukewaite](https://github.com/lukewaite))
- Update README.md [\#3](https://github.com/zanui/chef-thumbor/pull/3) ([ebaioni](https://github.com/ebaioni))


## v0.1.0

- Enrico Stahn - Initial release of thumbor