# frozen_string_literal: true
#
# Copyright:: Copyright (c) Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

namespace :spellcheck do
  task :fetch_common do
    sh "wget https://raw.githubusercontent.com/chef/chef_dictionary/master/chef.txt -O chef_dictionary.txt"
  end

  task run: :fetch_common do
    sh 'cspell "**/*"'
  end

  desc "List the unique unrecognized words in the project."
  task unknown_words: :fetch_common  do
    sh 'cspell "**/*" --wordsOnly --no-summary | sort | uniq'
  end
end

desc "Run spellcheck on the project."
task spellcheck: "spellcheck:run"
