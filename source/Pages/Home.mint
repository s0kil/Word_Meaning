component Pages.Home {
  fun handleSubmit (event : Html.Event) {
    sequence {
      Html.Event.preventDefault(event)

      case (wordInput) {
        Maybe::Just inputElement =>
          sequence {
            Dictionary.getWordMeaning(Dom.getValue(inputElement))
            Window.navigate("/#{Dom.getValue(inputElement)}")
          }

        Maybe::Nothing => next {  }
      }
    }
  }

  fun render {
    <form onSubmit={handleSubmit}>
      <input as wordInput type="text"/>

      <button type="submit">
        "Get Definition"
      </button>
    </form>
  }
}
