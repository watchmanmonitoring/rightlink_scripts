name        "rlw"
maintainer  "RightScale, Inc."
license     "see LICENSE file in repository root"
description "Base scripts for RightLink10 on Windows (RLL) to initialize basic functionality"
version     '0.2015.4068239413'

recipe      "rlw::wait-for-eip", "Wait for external IP address to be assigned (EC2 issue)"
recipe      "rlw::install_updates", "Installs windows updates"
recipe      "rlw::install_updates_by_kb", "Microsoft KB number of update to be installed"
recipe      "rlw::service-shutdown-timeout", "Sets amount of time for services to complete on shutdown"
recipe      "rlw::setup_automatic_upgrade", "Periodically checks if an upgrade is available and upgrade if there is."
recipe      "rlw::setup_hostname", "Changes the hostname of the server"
recipe      "rlw::shutdown-reason", "Print out the reason for shutdown"
recipe      "rlw::ssc-serv", "Installs and configures SSC for RightScale monitoring"
recipe      "rlw::test-script", "Test operational script, used by righlinklite/tester"
recipe      "rlw::upgrade", "Check whether a RightLink upgrade is available and do the upgrade"
recipe      "rlw::update_policy", "Define the Windows automatic update policy for the instance"

attribute   "SERVER_HOSTNAME",
  :display_name => "Hostname for this server",
  :description => "The server's hostname may contain letters (a-z, A-Z), numbers (0-9), and hyphens (-), " +
  "but no spaces or periods (.). The name may not consist entirely of digits, and " +
  "may not be longer than 63 characters.",
  :required => "optional",
  :type => "string",
  :default => "",
  :recipes => ["rlw::setup_hostname"]

attribute   "SERVICE_SHUTDOWN_TIMEOUT",
  :display_name => "Timeout in seconds",
  :description => "The amount of time on shutdown or reboot that the operating system will wait to kill services.",
  :required => "optional",
  :type => "string",
  :default => "",
  :recipes => ["rlw::service-shutdown-timeout"]

attribute   "WINDOWS_UPDATES_REBOOT_SETTING",
  :display_name => "Setting whether to reboot automatically",
  :description => "Specify how the Windows automatic updates should be applied to a running server. " +
  "For example, you may not want the server to automatically reboot itself after applying an update. " +
  "Set to 'Allow Reboot' for automatic reboots.",
  :required => "optional",
  :type => "string",
  :choice => ["Do Not Allow Reboot", "Allow Reboot"],
  :default => "Do Not Allow Reboot",
  :recipes => ["rlw::setup_hostname", "rlw::install_updates", "install_updates_by_kb"]

attribute   "WINDOWS_AUTOMATIC_UPDATES_POLICY",
  :display_name => "Windows Automatic Updates Policy",
  :required => "optional",
  :type => "string",
  :choice => ["Disable automatic updates", "Notify before download",
              "Notify before installation", "Install updates automatically"],
  :default => "Disable automatic updates",
  :recipes => ["rlw::update_policy"]

attribute   "KB_ARTICLE_NUMBER",
  :display_name => "Microsoft KB Article to download and install",
  :required => "optional",
  :type => "string",
  :recipes => ["rlw::install_updates_by_kb"]

attribute   "SSC_SERV_VERSION",
  :display_name => "SSC Serv version to use",
  :required => "optional",
  :type => "string",
  :default => "3.5.0",
  :recipes => ["rlw::ssc-serv"]

attribute   "SSC_SERV_PLATFORM",
  :display_name => "SSC Serv platform to use",
  :required => "optional",
  :type => "string",
  :default => "x86-64",
  :recipes => ["rlw::ssc-serv"]

attribute   "RS_TSS",
  :display_name => "RightScale monitoring server to send data to",
  :required => "optional",
  :type => "string",
  :default => "env:RS_TSS",
  :recipes => ["rlw::ssc-serv"]

attribute   "RS_INSTANCE_UUID",
  :display_name => "RightScale monitoring ID for this server",
  :required => "optional",
  :type => "string",
  :default => "env:RS_INSTANCE_UUID",
  :recipes => ["rlw::ssc-serv"]

attribute   "ENABLE_AUTO_UPGRADE",
  :display_name => "Enables auto upgrade of RightLink10",
  :required => "optional",
  :type => "string",
  :default => "true",
  :choice => ["true", "false"],
  :recipes => ["rlw::setup_automatic_upgrade"]

attribute   "UPGRADES_FILE_LOCATION",
  :display_name => "External location of 'upgrades' file",
  :required => "optional",
  :type => "string",
  :default => "https://rightlink.rightscale.com/rightlink/upgrades",
  :recipes => ["rlw::upgrade"]

attribute   "UTF8_STRING_INPUT",
  display_name: "UTF8 String Input",
  required: "recommended",
  type: "string",
  default: "hello,здравствуйте",
  recipes: ["rlw::test-script"]

attribute   "STRING_INPUT_1",
  display_name: "String Input 1",
  required: "recommended",
  type: "string",
  default: "Default String Input 1",
  recipes: ["rlw::test-script"]

attribute   "STRING_INPUT_2",
  display_name: "String Input 2",
  required: "recommended",
  type: "string",
  default: "Default String Input 2",
  recipes: ["rlw::test-script"]

attribute   "CRED_INPUT",
  display_name: "Credential Input",
  required: "recommended",
  type: "string",
  recipes: ["rlw::test-script"]

attribute   "ARRAY_INPUT_1",
  display_name: "Array Input 1",
  required: "recommended",
  type: "array",
  default: ["ARRAY_ITEM_1", "ARRAY_ITEM_2", "ARRAY_ITEM_3"],
  recipes: ["rlw::test-script"]
