thumbor CHANGELOG
=================

This file is used to list changes made in each version of the thumbor cookbook.

1.0.0
-----
- Enrico Stahn - Major refactoring of the cookbook
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

0.1.0
-----
- Enrico Stahn - Initial release of thumbor
