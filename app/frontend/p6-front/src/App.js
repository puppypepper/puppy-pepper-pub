import {
  BrowserRouter,
  Routes,
  Route,
} from "react-router-dom"

import Header from "./Header.js"
import Home from "./Home.js"
import Info from "./Info.js"

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <div>
          <Header />
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/info" element={<Info />}/>
          </Routes>
        </div>
      </BrowserRouter>
    </div>
  );
}

export default App;
