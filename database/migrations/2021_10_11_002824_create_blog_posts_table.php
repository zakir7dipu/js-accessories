<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlogPostsTable extends Migration
{
    /**
     * Run the migrations.
     *'category_id', 'user_id','title', 'thumbnail', 'body', 'tags', 'slug', 'status'
     * @return void
     */
    public function up()
    {
        Schema::create('blog_posts', function (Blueprint $table) {
            $table->id();
            $table->integer('category_id');
            $table->integer('user_id');
            $table->string('title');
            $table->string('thumbnail')->nullable();
            $table->longText('body');
            $table->longText('tags')->nullable();
            $table->string('slug');
            $table->boolean('status')->default(true)->comment('0 = unpublish, 1 = publish');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blog_posts');
    }
}
