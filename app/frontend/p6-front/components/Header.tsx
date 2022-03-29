import Link from 'next/link'

const Header = () => {
  return (
    <>
      <Link href="/api/hello">
        <a>hello</a>
      </Link>
      <a>hoge</a>
      <a>fuga</a>
    </>
  )
}

export default Header
