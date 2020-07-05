record WordDefinition {
  shortDefinition : Array(String) using "shortdef"
}

store Dictionary {
  const API = "https://dictionaryapi.dominate.workers.dev"

  state wordDefinitions : Array(WordDefinition) = [{ shortDefinition = [""] }]

  fun handleError (error : a) {
    parallel {
      Debug.log(error)
    }
  }

  fun getWordMeaning (word : String) {
    sequence {
      response =
        API + "/?word=" + word
        |> Http.get()
        |> Http.send()

      json =
        Json.parse(response.body)
        |> Maybe.toResult("Failed To Decode JSON")

      object =
        decode json as Array(WordDefinition)

      next { wordDefinitions = object }
    } catch Http.ErrorResponse => error {
      handleError(error)
    } catch String => error {
      handleError(error)
    } catch Object.Error => error {
      handleError(error)
    }
  }
}
