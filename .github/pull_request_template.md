# Scope

_Please make sure to read the mobile development guide provided.
and check that you understand and have followed it as best as possible Explain what your feature
does in a short paragraph._ please check the below boxes
- [ ] I have followed the coding conventions
- [ ] I have added/updated necessary tests
- [ ] I have tested the changes added on a physical device

## Closes/Fixes Issues
_Declare any issues by typing `fixes #1` or `closes #1` for example so that the automation can kick
in when this is merged_

## Other testing QA Notes
_What have you tested specifically and what possible impacts/areas there are that may need retesting
by others._

Please add a screenshot (if necessary)

## Contribution

_For every push that you make , make user to update the build number_
 
 ``` yaml

  version: 0.5.0+1
  
  +1 is the build number
 ```

_For every bug fixed or updated on a feature that you make , make user to update the patch number_

 
 ``` yaml

  version: 0.5.0+1
  
  0.5.patchNumber+1
 ```


 _For every new feature and functionality completion  , make user to update the minor version number_

 
 ``` yaml

  version: 0.5.0+1
  
  0.minorVersionNumber.0+1
 ```


> Before you push your changes to make sure you update the changelog and indicate changes made.
A new changelog entry will be added on `patches` / `minor version build` / `releases or major release` . 
Change log will follow this formate.

``` make
## Added = > for new features.
## Changed for  =>  changes in existing functionality.
## Deprecated => for soon-to-be removed features.
## Removed  => for now removed features.
## Fixed => for any bug fixes.
## Security = > in case of vulnerabilities.
```