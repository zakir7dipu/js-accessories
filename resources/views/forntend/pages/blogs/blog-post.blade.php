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
                    <li class="breadcrumb-item"><a href="{{ route('blog.index') }}">{{ __('Blog') }}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ $post->title }}</li>
                </ol>
            </div><!-- End .container -->
        </nav>

        <div class="page-header">
            <div class="container">
                <h1>{{ $post->title }}</h1>
            </div><!-- End .container -->
        </div><!-- End .page-header -->

        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <article class="entry single">
                        <div class="entry-media">
                            <img src="{{ $post->thumbnail?asset($post->thumbnail):'' }}" alt="Post" class="pinterest-img">
                        </div><!-- End .entry-media -->

                        <div class="entry-body">
                            <div class="entry-date">
                                <span class="day">{{ date('d', strtotime($post->created_at)) }}</span>
                                <span class="month">{{ date('m', strtotime($post->created_at)) }}</span>
                            </div><!-- End .entry-date -->

                            <h2 class="entry-title post-title">
                               {{ $post->title }}
                            </h2>

                            <div class="entry-meta">
                                <span><i class="icon-calendar"></i>{{ date('d', strtotime($post->created_at)) }}</span>
                                <span><i class="icon-user"></i>{{ __('By') }} <a href="javascript:void(0)">{{ $post->user->name }}</a></span>
                                <span>
                                    <i class="icon-folder-open"></i>
                                        @php
                                            $tags = explode(',', $post->tags)
                                        @endphp
                                    @foreach($tags as $tag)
                                        <a href="javascript:void(0)">{{ $tag }}</a>,
                                    @endforeach
                                    </span>
                            </div><!-- End .entry-meta -->

                            <div class="entry-content">
                                <p>{!! $post->body !!}</p>
                            </div><!-- End .entry-content -->

                            <div class="entry-share">
                                <h3>
                                    <i class="icon-forward"></i>
                                    {{ __('Share this post') }}
                                </h3>

                                <div class="social-icons">
                                    <a href="javascript:void(0)" id="facebook" class="social-icon social-facebook" target="_blank" title="Facebook">
                                        <i class="icon-facebook"></i>
                                    </a>
                                    <a href="javascript:void(0)" id="twitter" class="social-icon social-twitter" target="_blank" title="Twitter">
                                        <i class="icon-twitter"></i>
                                    </a>
                                    <a href="javascript:void(0)" id="linkedin" class="social-icon social-linkedin" target="_blank" title="Linkedin">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                    <a href="javascript:void(0)" id="pinterest" class="social-icon social-pinterest" target="_blank" title="Pinterest">
{{--                                        <i class="icon-mail-alt"></i>--}}
                                        <i class="fab fa-pinterest-p"></i>
                                    </a>
                                    <a href="javascript:void(0)" id="whatsapp" class="social-icon social-whatsapp" target="_blank" title="Whatsapp">
{{--                                        <i class="icon-mail-alt"></i>--}}
                                        <i class="fab fa-whatsapp"></i>
                                    </a>
                                </div><!-- End .social-icons -->
                            </div><!-- End .entry-share -->

                            <div class="comment-respond">
                                {!! $commentSetting->code !!}
                            </div><!-- End .comment-respond -->
                        </div><!-- End .entry-body -->
                    </article><!-- End .entry -->
                </div><!-- End .col-lg-9 -->

                <aside class="sidebar col-lg-3">
                    <div class="sidebar-wrapper">
                        <div class="widget widget-search">
                            <form role="search" method="get" class="search-form" action="#">
                                <input type="search" class="form-control" placeholder="Search posts here..." name="s" required>
                                <button type="submit" class="search-submit" title="Search">
                                    <i class="icon-search"></i>
                                    <span class="sr-only">{{ __('Search') }}</span>
                                </button>
                            </form>
                        </div><!-- End .widget -->

                        <div class="widget widget-categories">
                            <h4 class="widget-title">{{ __('Blog Categories') }}</h4>

                            <ul class="list">
                                @foreach($bolgCategories as $key => $bolgCategory)
                                    <li><a href="#">{{ $bolgCategory->name }}</a></li>
                                @endforeach
                            </ul>
                        </div><!-- End .widget -->

                        <div class="widget">
                            <h4 class="widget-title">{{ __('Recent Posts') }}</h4>

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
                            <h4 class="widget-title">{{ __('Tagcloud') }}</h4>

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
    <script src="{{ asset('social-share/social-share.js') }}"></script>
@endsection
