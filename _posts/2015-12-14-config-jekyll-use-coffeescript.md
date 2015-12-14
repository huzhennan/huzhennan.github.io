---
layout: post
title:  "配置jekyll使用coffeescript"
categories: jekyll
---

# 配置jekyll使用coffeescript
## 安装jekyll-coffeescript
* 直接安装 `gem install jekyll-coffeescript`
* 放在Gemfile里，`bundle install`
{% highlight ruby %}
group :jekyll_plugins do
	gem 'jekyll'
	gem 'jekyll-coffeescript'
end	
{% endhighlight %}

## 把jekyll-coffeescript加入到配置文件`_config.yml`中
{% highlight yaml %}
gems:
  - jekyll-coffeescript
{% endhighlight %}