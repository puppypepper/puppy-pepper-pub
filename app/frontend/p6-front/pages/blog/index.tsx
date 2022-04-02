import type { NextPage } from 'next'
import Link from 'next/link'
import Layout from 'components/Layout'
import ArticleS3Client from 'utils/S3'
import styles from 'styles/Home.module.css'

const Home: NextPage = (props: any) => {
  return (
    <div className={styles.container}>
      <Layout>
        <ul>
          {
            props.articles.map((article: string) => {
              const articleTitle = article.replace("puppy-pepper/","")
              const articleLink = "/blog/" + articleTitle
              return (
                <li key={articleTitle}>
                  <Link href={articleLink}>{articleTitle}</Link>
                </li>
              )
            })
          }
        </ul>
      </Layout>
    </div>
  )
}

export const getStaticProps = async () => {

  const articleS3Client = new ArticleS3Client()
  const articles = await articleS3Client.getArticleLists("puppy-pepper")

  // コンポーネントに渡すデータを指定
  return {
    props: { articles },
    revalidate: 300,
  }
}

export default Home