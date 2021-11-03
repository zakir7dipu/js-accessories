@extends('backend.layouts.master-layout')

@section('title', $title)

@section('page-css')

@endsection

@section('content')

    <div id="wrapper-content">
        <div class="row">
            <div class="col">
                <nav class="breadcrumb justify-content-sm-start justify-content-center text-center text-light bg-dark ">
                    <a class="breadcrumb-item text-white" href="{{route('admin.dashboard')}}">{{__('Home')}}</a>
                    <span class="breadcrumb-item active">{{ __($title) }}</span>
                    <span class="breadcrumb-info" id="time"></span>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card card-dark bg-dark">
                    <div class="card-header d-block">
                        <h6 class="card-title lh-35">{{ __($title) }}</h6>
                    </div>

                    <form action="{{ route('admin.widget.category-section.index') }}" method="post">
                        @csrf

                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-3 mx-auto">
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td class="text-right font-weight-bold">{{ __('Show') }}</td>
                                            <td>
                                                <label class="switch">
                                                    <input type="checkbox" class="content-show" name="show" {{ $categorySection?($categorySection->show?'checked':''):'checked' }}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group">
                                <p class="mb-1 font-weight-bold"><label for="number_of_content">{{__('Number of content :')}}</label></p>
                                <div class="input-group input-group-lg mb-3">
                                    <input type="number" name="number_of_content" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                           placeholder="{{__('Number of content')}}" value="{{ $categorySection?$categorySection->number_of_content:old('number_of_content') }}">
                                    <br>
                                    @if ($errors->has('number_of_content'))
                                        <span class="text-danger">{{ $errors->first('number_of_content') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-danger btn-lg rounded">{{ __('Save') }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('page-script')
    @include('backend.pages.widgets.sliders.internal-assets.slider-js')
@endsection
