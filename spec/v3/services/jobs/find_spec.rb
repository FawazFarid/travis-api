describe Travis::API::V3::Services::Jobs::Find, set_app: true do
  let(:repo)  { Travis::API::V3::Models::Repository.where(owner_name: 'svenfuchs', name: 'minimal').first }
  let(:build) { repo.builds.first }
  let(:jobs)  { Travis::API::V3::Models::Build.find(build.id).jobs }
  let(:commit){ build.commit }
  let(:parsed_body) { JSON.load(body) }

  describe "jobs on public repository" do
    before     { get("/v3/build/#{build.id}/jobs") }
    example    { expect(last_response).to be_ok }
    example    { expect(parsed_body).to be == {
      "@type"              => "jobs",
      "@href"              => "/v3/build/#{build.id}/jobs",
      "@representation"    => "standard",
      "jobs"             => [{
        "@type"            => "job",
        "@href"            => "/v3/job/#{jobs[0].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => false,
          "restart"        => false,
          "debug"          => false },
        "id"               => jobs[0].id,
        "number"           => "#{jobs[0].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[1].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => false,
          "restart"        => false,
          "debug"          => false },
        "id"               => jobs[1].id,
        "number"           => "#{jobs[1].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[2].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => false,
          "restart"        => false,
          "debug"          => false },
        "id"               => jobs[2].id,
        "number"           => "#{jobs[2].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[3].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => false,
          "restart"        => false,
          "debug"          => false },
        "id"               => jobs[3].id,
        "number"           => "#{jobs[3].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}}
        ]
      }
    }
  end

  describe "jobs private repository, private API, authenticated as user with access" do
    let(:token)   { Travis::Api::App::AccessToken.create(user: repo.owner, app_id: 1) }
    let(:headers) {{ 'HTTP_AUTHORIZATION' => "token #{token}"                        }}
    before        { Travis::API::V3::Models::Permission.create(repository: repo, user: repo.owner, pull: true) }
    before        { repo.update_attribute(:private, true)                             }
    before        { get("/v3/build/#{build.id}/jobs", {}, headers)                           }
    after         { repo.update_attribute(:private, false)                            }
    example       { expect(last_response).to be_ok                                    }
    example    { expect(parsed_body).to be == {
      "@type"              => "jobs",
      "@href"              => "/v3/build/#{build.id}/jobs",
      "@representation"    => "standard",
      "jobs"             => [{
        "@type"            => "job",
        "@href"            => "/v3/job/#{jobs[0].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => true,
          "restart"        => true,
          "debug"          => false },
        "id"               => jobs[0].id,
        "number"           => "#{jobs[0].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[1].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => true,
          "restart"        => true,
          "debug"          => false },
        "id"               => jobs[1].id,
        "number"           => "#{jobs[1].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[2].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => true,
          "restart"        => true,
          "debug"          => false },
        "id"               => jobs[2].id,
        "number"           => "#{jobs[2].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}},
        {"@type"            => "job",
        "@href"            => "/v3/job/#{jobs[3].id}",
        "@representation"  => "standard",
        "@permissions"     => {
          "read"           => true,
          "cancel"         => true,
          "restart"        => true,
          "debug"          => false },
        "id"               => jobs[3].id,
        "number"           => "#{jobs[3].number}",
        "state"            => "configured",
        "started_at"       => "2010-11-12T13:00:00Z",
        "finished_at"      => nil,
        "build"            => {
          "@type"          => "build",
          "@href"          => "/v3/build/#{build.id}",
          "@representation"=> "minimal",
          "id"             => build.id,
          "number"         => build.number,
          "state"          => "configured",
          "duration"       => nil,
          "event_type"     => "push",
          "previous_state" => "passed",
          "started_at"     => "2010-11-12T13:00:00Z",
          "finished_at"    => nil},
        "queue"            => "builds.linux",
        "repository"       =>{
          "@type"          => "repository",
          "@href"          => "/v3/repo/1",
          "@representation"=>"minimal",
          "id"             => repo.id,
          "name"           => "minimal",
          "slug"           => "svenfuchs/minimal"},
        "commit"           =>{
          "@type"          => "commit",
          "@representation"=> "minimal",
          "id"             => commit.id,
          "sha"            => commit.commit,
          "ref"            => commit.ref,
          "message"        => commit.message,
          "compare_url"    => commit.compare_url,
          "committed_at"   =>"2010-11-12T12:55:00Z"},
        "owner"            =>{
          "@type"          => "user",
          "@href"          => "/v3/user/1",
          "@representation"=> "minimal",
          "id"             =>  1,
          "login"          => "svenfuchs"}}
        ]
      }
    }
  end
end
