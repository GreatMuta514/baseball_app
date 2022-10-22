module ApplicationHelper
  def default_meta_tags
    {
      site: '野球バカ実況',
      title: '',
      reverse: true,
      description: '野球の試合を見ながらリアルタイムチャットで話せる。試合の勝敗を予想しコメントで議論できる。野球が好きすぎる人に向けたサービス。',
      keywords: '野球,バカ,野球バカ,野球馬鹿,実況,チャット,オープンチャット,勝敗予想,試合予想,スコア予想', # キーワードを「,」区切りで設定する
      canonical: request.original_url, # 優先するurlを指定する
      icon: [  # favicon、apple用アイコンを指定する
        { href: image_url('ball.jpg') },
        { href: image_url('ball.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: '野球バカ実況',
        title: '野球バカ実況',
        description: '野球の試合を見ながらリアルタイムチャットで話せる。試合の勝敗を予想しコメントで議論できる。野球が好きすぎる人に向けたサービス。',
        type: 'website',
        url: request.original_url,
        image: image_url('top_cover.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@baseballapp514',
        image: image_url('top_cover.jpg')
      }
    }
  end
end
