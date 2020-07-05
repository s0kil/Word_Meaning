component Main {
  connect Route exposing { currentPage }

  style container {
    width: 100%;
    height: 100%;
    padding: 1rem;

    background: #f1f3f5;
  }

  fun render {
    <main::container>
      case (currentPage) {
        Page::Home => <Pages.Home/>
        Page::NotFound => <Pages.NotFound/>
        Page::WordDefinition => <Pages.WordDefinition/>
      }
    </main>
  }
}
