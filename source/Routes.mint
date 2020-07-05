enum Page {
  WordDefinition
  NotFound
  Home
}

store Route {
  state currentPage : Page = Page::Home

  fun setRoute (page : Page) {
    sequence {
      Http.abortAll()

      next { currentPage = page }
    }
  }
}

routes {
  / {
    sequence {
      Route.setRoute(Page::Home)
    }
  }

  /:slug (slug : String) {
    sequence {
      Dictionary.getWordMeaning(slug)
      Route.setRoute(Page::WordDefinition)
    }
  }

  * {
    sequence {
      Route.setRoute(Page::NotFound)
    }
  }
}
