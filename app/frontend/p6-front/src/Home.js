import React from "react";
import Unity, {UnityContext} from "react-unity-webgl";

import "./Home.css"

const unityContext = new UnityContext({
  loaderUrl: "Breakout/Build/Breakout.loader.js",
  dataUrl: "Breakout/Build/Breakout.data.gz",
  frameworkUrl: "Breakout/Build/Breakout.framework.js.gz",
  codeUrl: "Breakout/Build/Breakout.wasm.gz",
});

function Home() {
  return (
    <div>
      <Unity 
        unityContext={unityContext}
        className="unity-canvas"
      />
    </div>
  );
}

export default Home;