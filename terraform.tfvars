project_id = "prj-xpn-host-prod"



vpc_fws = [

 



{

  name     = "fw-vpc-prod-shared-base-euw3-egress-arfac-internal"

  description = ""

  direction   = "EGRESS"

  vpc_name                = "vpc-prod-shared-base-euw3"

  target_tags             = ["nt-arfac"]

  allow = [

  {

    ports =[



    ]

    protocol = "all"

  },

 ]

  deny        = []

  ranges = [




"10.4.5.110",



 ]

  source_service_accounts = null

  source_tags             = null

  target_service_accounts = null

  priority = 1000

  log_config = {

    metadata = "INCLUDE_ALL_METADATA"

  }

  },



{

  name     = "fw-prod-shared-base-euw3-ingress-arfac-internal"

  description = ""

  direction   = "INGRESS"

  vpc_name                = "vpc-prod-shared-base-euw3"

  target_tags             = ["nt-arfac"]

  allow = [

  {

    ports =[



    ]

    protocol = "all"

  },

 ]

  deny        = []

  ranges = [

"10.4.5.110",



 ]

  source_service_accounts = null

  source_tags             = null

  target_service_accounts = null

  priority = 1000

  log_config = {

    metadata = "INCLUDE_ALL_METADATA"

  }

  },

]


