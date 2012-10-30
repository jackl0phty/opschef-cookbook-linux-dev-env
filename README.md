Travis-ci status: [![Build Status](https://secure.travis-ci.org/jackl0phty/opschef-cookbook-linux-dev-env.png?branch=master)](http://travis-ci.org/jackl0phty/opschef-cookbook-linux-dev-env)

Description
===========

The primary focus of this cookbook will be preparing a GNU/Linux desktop/laptop/workstation/etc for various
types of Development.  The initial focus will be on Android and, at some point, on Arm Assembly on the
Raspberry Pi & Lua.

Supported Development Environments
==================================
* Android

Supported platforms
===================

This cookbook has only been tested on Linux Mint, my development platform of choice.
However, should work on Debian and Ubuntu.

Requirements
============

Create a role and apply it to your node's definition like so:
<pre><code>
name "android_dev"
description "Configure a GNU/Linux desktop/laptop for Android development "
run_list "recipe[linux-dev-env::android]"
override_attributes "linux-dev-env" => { "android_user" => "skywalker",
					 "android_group" => "skywalker" }
</pre></code>

The above code creates a role named 'android_dev', applies the linux-dev-env::android
recipe to your node, and sets the 'android_user' and 'android_group' to 'skywalker'.
This is the uid/gid of the user you plan on doing Android development under.

Next use knife to upload your 'android_role' like so:
<pre><code>
knife role from file roles/android_dev.rb
</pre></code>

Now create your node's definition in the /nodes directory like so:
<pre><code>
{
    "normal": {
    },
    "name": "skywalker-laptop",
    "chef_environment": "test",
    "override": {
    },
	"test": {
    },
    "json_class": "Chef::Node",
    "automatic": {
    },
    "run_list": [
	"role[android_dev]",
	"recipe[linux-dev-env::eclipse]",
	"recipe[linux-dev-env::java]"
    ],
    "chef_type": "node"
}
</pre></code>

The above code defines your node's definition, adds it to a test environment, applies your android_dev role, and 
also applies recipes linux-dev-env::eclipse & linux-dev-env::java.

The linux-dev-env::eclipse will install the latest version of the 'classic' version of the popular Eclipse IDE.

The linux-dev-env::java recipe will install Sun Java 6u37 and set it as the default Java via update-alternatives.
 
Attributes
==========

The following attribues can be set in this cookbook:

Set Android SDK install directory.
<pre><code>
default['linux-dev-env']['android_sdk_install_dir'] = '/opt'
</pre></code>
Set Android user. CHANGE THIS!
<pre><code>
default['linux-dev-env']['android_user'] = 'skywalker'
</pre></code>
Set Android group, CHANGE THIS!
<pre><code>
default['linux-dev-env']['android_group'] = 'skywalker'
</pre></code>
Set Android SDK version.
<pre><code>
default['linux-dev-env']['android_sdk_version'] = 'r20.0.3'
</pre></code>
Set Eclipse IDE  install directory.
<pre><code>
default['linux-dev-env']['eclipse_ide_install_dir'] = '/opt'
</pre></code>
Set Eclipse IDE version.
<pre><code>
default['linux-dev-env']['eclipse_ide_version'] = '4.2.1'
</pre></code>
Java version to install.
<pre><code>
default['linux-dev-env']['java_version'] = '6u37'
</pre></code>

You will need to at least set 'android_user' and 'android_group'.  This is the uid/gid under which you will be
doing Android development.
