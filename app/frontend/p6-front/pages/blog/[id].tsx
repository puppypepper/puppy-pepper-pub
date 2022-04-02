import Link from 'next/link'
import React from 'react'
import ReactMarkdown from 'react-markdown'
import ArticleS3Client from 'utils/S3'

type PathParams = {
  id: string
}

type PageProps = {
  articleBody: any
}

const Article = ({ articleBody }: PageProps) => {
  return (
    <div>
      <ReactMarkdown skipHtml={true}>{articleBody}</ReactMarkdown>
      <Link href="/blog">blog_home</Link>
    </div>
  )
}

export const getStaticPaths = async () => {

  const articleS3Client = new ArticleS3Client()
  const articles = await articleS3Client.getArticleLists("puppy-pepper")

  let paths: object[] = []
  articles.forEach((article) => {
    paths.push({ params: { id: article }})
  })

  return {
    paths: paths,
    fallback: false
  }
}

export const getStaticProps = async (paths: any) => {
  const { id } = paths.params as PathParams

  const articleS3Client = new ArticleS3Client()
  const articleBody = await articleS3Client.getArticleBody("puppy-pepper", id)

  const props: PageProps = {
    articleBody: articleBody
  }

  return { 
    props: props,
    revalidate: 300,
  }
}

export default Article