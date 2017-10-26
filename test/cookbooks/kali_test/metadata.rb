# -*- coding: utf-8 -*-

name 'kali_test'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache-2.0'
description 'Integration testing Kali cookbook'
chef_version '>= 12.5' if respond_to?(:chef_version)
version '0.1.0'

recipe 'kali_test::requirements', 'Install packages requirements'
