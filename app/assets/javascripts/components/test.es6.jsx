class Test extends React.Component {
  render () {
    return (
      <section className="hero is-info is-left">
          <div className="hero-header">
            <header className="header">
              <div className="container">
                <div className="header-left">
                  <a className="header-item" href="#">
                    <h1>Admin</h1>
                  </a>
                </div>
                <span className="header-toggle">
                  <span></span>
                  <span></span>
                  <span></span>
                </span>
                <div className="header-right header-menu">
                  <span className="header-item">
                    <a href="#">Preview</a>
                  </span>
                  <span className="header-item">
                    <a className="button is-info is-inverted">
                      <i className="fa fa-sign-out"></i>
                      Quit
                    </a>
                  </span>
                </div>
              </div>
            </header>
          </div>

          <div className="hero-content">
            <div className="container">
              <h1 className="title">
                Title
              </h1>
              <h2 className="subtitle">
                Subtitle
              </h2>
            </div>
          </div>

          <div className="hero-footer">
            <nav className="tabs is-boxed is-fullwidth">
              <div className="container">
                <ul>
                  <li className="is-active"><a href="#">Events</a></li>
                  <li><a href="#">Club</a></li>
                </ul>
              </div>
            </nav>
          </div>
        </section>
    )
  }
}
