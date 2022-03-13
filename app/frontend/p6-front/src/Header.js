import {
  Link,
} from "react-router-dom"

import "./Header.css"

function Header() {
  return(
    <div className="header-div">
      <div className="header-logo">
        <a className="header-logo">PuppyPepper</a>
      </div>
      <nav>
        <ul className="header-ul">
          <li className="header-li">
            <Link className="header-link" to="/">Home</Link>
          </li>
          <li className="header-li">
            <Link className="header-link" to="/info">Info</Link>
          </li>
        </ul>
      </nav>
    </div>
  );
}

export default Header;