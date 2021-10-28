<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlogPostCommentSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *'code', 'url'
     * @return void
     */
    public function up()
    {
        Schema::create('blog_post_comment_settings', function (Blueprint $table) {
            $table->id();
            $table->longText('code');
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
        Schema::dropIfExists('blog_post_comment_settings');
    }
}
