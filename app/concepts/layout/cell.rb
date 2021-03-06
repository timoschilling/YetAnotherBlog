class Layout::Cell < ApplicationConcept
  register :application

  def stylesheet_link_tag(*)
    %{<link rel="stylesheet" media="all" href="/assets/application.css" />}
  end

  def javascript_include_tag(*)
    %{<script src="/assets/application.js"></script>}
  end

  def csrf_meta_tags
    %{<meta name="" content="">}
  end

  def content
    model
  end
end
