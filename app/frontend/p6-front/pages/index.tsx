import type { NextPage } from 'next'
import Unity, { UnityContext } from "react-unity-webgl"

import Layout from 'components/Layout'

import styles from 'styles/Home.module.css'

const unityContext = new UnityContext({
  loaderUrl: "Breakout/Build/Breakout.loader.js",
  dataUrl: "Breakout/Build/Breakout.data.gz",
  frameworkUrl: "Breakout/Build/Breakout.framework.js.gz",
  codeUrl: "Breakout/Build/Breakout.wasm.gz",
})

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Layout title="p6">
        <Unity 
          unityContext={ unityContext }
          className={styles.unityCanvas}
        />
      </Layout>
    </div>
  )
}

export default Home
