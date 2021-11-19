@extends('forntend.layouts.master-layout')

@section('title', config('app.name'))

@section('page-css')

@endsection

@section('content')
    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">{{ __('Home') }}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ __('Blog') }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="page-header">
            <div class="container">
                <h1>{{ __('Blog') }}</h1>
            </div><!-- End .container -->
        </div><!-- End .page-header -->

        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    @foreach($blogs as $post)
                        <article class="entry">
                            <div class="entry-media">
                                <a href="javascript:void(0)">
                                    <img src="{{ asset($post->thumbnail) }}" alt="Post">
                                </a>
                            </div><!-- End .entry-media -->

                            <div class="entry-body">
                                <div class="entry-date">
                                    <span class="day">{{ date('d', strtotime($post->created_at)) }}</span>
                                    <span class="month">{{ date('m', strtotime($post->created_at)) }}</span>
                                </div><!-- End .entry-date -->

                                <h2 class="entry-title">
                                    <a href="{{ route('blog.per-blog',$post->id) }}">{{ $post->title }}</a>
                                </h2>

                                <div class="entry-content">
                                    <p>{!! substr(strip_tags($post->body),0,200).'....' !!}</p>

                                    <a href="javascript:void(0)" class="read-more">Read More <i class="icon-angle-double-right"></i></a>
                                </div><!-- End .entry-content -->

                                <div class="entry-meta">
                                    <span><i class="icon-calendar"></i>{{ date('M d, Y', strtotime($post->created_at)) }}</span>
                                    <span><i class="icon-user"></i>By <a href="#">{{ $post->user->name }}</a></span>
                                    <span><i class="icon-folder-open"></i>
                                        @php
                                            $tags = explode(',', $post->tags)
                                        @endphp
                                        @foreach($tags as $tag)
                                        <a href="#">{{ $tag }}</a>,
                                        @endforeach
                                    </span>
                                </div><!-- End .entry-meta -->
                            </div><!-- End .entry-body -->
                        </article><!-- End .entry -->
                    @endforeach

                    <nav class="toolbox toolbox-pagination">
                        {{ $blogs->links() }}
                    </nav>
                </div><!-- End .col-lg-9 -->

                <aside class="sidebar col-lg-3">
                    <div class="sidebar-wrapper">
                        <div class="widget widget-search">
                            <form role="search" method="get" class="search-form" action="#">
                                <input type="search" class="form-control" placeholder="Search posts here..." name="s" required>
                                <button type="submit" class="search-submit" title="Search">
                                    <i class="icon-search"></i>
                                    <span class="sr-only">Search</span>
                                </button>
                            </form>
                        </div><!-- End .widget -->

                        <div class="widget widget-categories">
                            <h4 class="widget-title">Blog Categories</h4>

                            <ul class="list">
                                @foreach($bolgCategories as $key => $bolgCategory)
                                    <li><a href="#">{{ $bolgCategory->name }}</a></li>
                                @endforeach
                            </ul>
                        </div><!-- End .widget -->

                        <div class="widget">
                            <h4 class="widget-title">Recent Posts</h4>

                            <ul class="simple-entry-list">
                                @foreach($recentBlogs as $recentBlog)
                                <li>
                                    <div class="entry-media">
                                        <a href="javascript:void(0)">
                                            <img src="{{ $recentBlog->thumbnail }}" alt="Post">
                                        </a>
                                    </div><!-- End .entry-media -->
                                    <div class="entry-info">
                                        <a href="javascript:void(0)">{{ $recentBlog->title }}</a>
                                        <div class="entry-meta">
                                            {{ date('M d, Y', strtotime($recentBlog->created_at)) }}
                                        </div><!-- End .entry-meta -->
                                    </div><!-- End .entry-info -->
                                </li>
                                @endforeach
                            </ul>
                        </div><!-- End .widget -->

                        <div class="widget">
                            <h4 class="widget-title">Tagcloud</h4>

                            <div class="tagcloud">
                                @foreach($allTags as $tag)
                                    @if($tag)
                                        <a href="#">{{ $tag }}</a>
                                    @endif
                                @endforeach
                            </div><!-- End .tagcloud -->
                        </div><!-- End .widget -->
                    </div><!-- End .sidebar-wrapper -->
                </aside><!-- End .col-lg-3 -->
            </div><!-- End .row -->
        </div><!-- End .container -->

        <div class="mb-6"></div><!-- margin -->
    </main><!-- End .main -->
@endsection

@section('page-script')

@endsection
