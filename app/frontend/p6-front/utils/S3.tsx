import {GetObjectCommand, ListObjectsCommand, S3Client} from '@aws-sdk/client-s3'

async function streamToString(stream: any) {
  const buf = []
  for await (const chunk of stream) {
    buf.push(Buffer.from(chunk))
  }
  return Buffer.concat(buf).toString('utf-8')
}

class ArticleS3Client {

  client: S3Client
  bucket: string

  constructor() {
    this.client = new S3Client({
      region: 'ap-northeast-1',
      credentials: {
        accessKeyId: process.env.ACCESS_KEY_ID as string,
        secretAccessKey: process.env.SECRET_ACCESS_KEY as string,
      },
    })

    this.bucket = process.env.ARTICLE_BUCKET as string
  }

  async getArticleLists(whose: string): Promise<string[]> {
    const listObjectsParams = {
      Bucket: this.bucket,
      Delimiter: "/",
      Prefix: whose+"/",
    }

    const response = await this.client.send(new ListObjectsCommand(listObjectsParams))

    let articles: string[] = []

    if (response && response.CommonPrefixes) {
        response.CommonPrefixes.forEach((article) => {
          if (article.Prefix) {
            const post = article.Prefix.replace(whose+"/","").replace(/.$/, "")
            articles.push(post)
          }
        })
    }

    // ex. articles = ["post1", "post2"]
    return articles
  }

  async getArticleBody(whose: string, articlePrefix: string): Promise<any> {

    const getMarkdownParams = {
      Bucket: this.bucket,
      Key: whose+"/"+articlePrefix+"/"+"article.md",
    }

    const cmd = new GetObjectCommand(getMarkdownParams)

    const response = await this.client.send(cmd)

    const articleBody = await streamToString(response.Body)

    return articleBody
  }

}

export default ArticleS3Client