class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?/$target?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
