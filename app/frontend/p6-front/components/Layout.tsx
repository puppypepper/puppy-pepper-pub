import Head from 'next/head'
import Link from 'next/link'

type Props = {
  children?: React.ReactNode
  title?: string
  description?: string
}

const Layout = ({ children, title, description }: Props) => {
  const pageTitle = title || 'title'
  return (
    <div>
      <Head>
        <title>{ pageTitle }</title>
        <meta name="description" content={ description || 'description'} />
      </Head>
      <nav>
        <ul>
          <li><Link href="/">home</Link></li>
          <li><Link href="/api/hello">hello</Link></li>
        </ul>
      </nav>
      <main>{ children }</main>
    </div>
  )
}

export default Layout