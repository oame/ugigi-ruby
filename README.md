# Ugigi

Ugigi Wrapper for Ruby 1.9.x

## Requirements

* Ruby 1.9.x
* mechanize gem

## Installation

	gem install ugigi

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
