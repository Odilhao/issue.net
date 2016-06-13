require 'rubygems'
require 'bundler'
Bundler.require(:rake)
require 'rake/clean'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet_blacksmith/rake_tasks'

desc "Validate manifests, templates, and ruby files"
task :test do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

task :default => [:test, :spec, :lint]


PuppetLint.configuration.send('disable_2sp_soft_tabs')
PuppetLint.configuration.send('disable_trailing_whitespace')
PuppetLint.configuration.send('disable_unquoted_resource_title')
PuppetLint.configuration.send('disable_arrow_alignment')
PuppetLint.configuration.send('disable_140chars')
PuppetLint.configuration.send('disable_hard_tabs')
PuppetLint.configuration.send('disable_double_quoted_strings')
PuppetLint.configuration.send('disable_quoted_booleans')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_variable_scope')
PuppetLint.configuration.send('disable_case_without_default')