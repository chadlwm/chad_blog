# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

{'原创文章' => 'originality',
 '好文转载' => 'transhipment',
 '外文翻译' => 'ranslation',
 '随笔感想' => 'prose'
}.each{|name, slug| Column.create!(name: name, slug: slug, introduce: "#{name}/#{slug}")}
