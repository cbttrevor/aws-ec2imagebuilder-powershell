## Learning Objectives

* Using PowerShell to clean up resources simplifies the process, avoiding needless pointing and clicking
* You need to work backwards to remove EC2 Image Builder resources, due to dependencies
  * Pipelines are dependent on recipes & distribution / infrastructure recipes. Recipes are dependent on components.
* Most AWS services follow a common API pattern
    * A `list` API that retrieves high-level information about resources
    * A `describe` API that retrieves more specific details about a single resource