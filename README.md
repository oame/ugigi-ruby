# ugigi-ruby

[![Build Status](https://secure.travis-ci.org/oame/ugigi-ruby.png?branch=master)](http://travis-ci.org/oame/ugigi-ruby)

うぎぎ検索 for Ruby

## 動作環境

* Ruby 1.8.x - 1.9.x

## インストール

	$ gem install ugigi

## Usage

	require "ugigi"
	
	# フリーワード検索で"ナズーリン"が含まれているSSを持ってくる
	naz_novels = Ugigi.search(:free => "ナズーリン")
	puts naz_novels.size
	
	# "寅丸星"がタグに設定されているSSを持ってくる
	novels = Ugigi.search(:tag => "寅丸星")
	novels.each do |novel|
		puts novel.title
	end
	
	# "にとり"が文章中に含まれているSSの数を持ってくる
	puts Ugigi.total_count(:free => "にとり")

	# 東方創想話に限定して検索
	puts Ugigi.search(:title => "霊夢", :only => :sosowa)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
