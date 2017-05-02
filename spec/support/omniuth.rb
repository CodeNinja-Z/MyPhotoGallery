# Ref: https://github.com/omniauth/omniauth/wiki/Integration-Testing

OmniAuth.config.test_mode = true

omniauth_hash = { 'provider' => '500px',
                  'uid' => '21967077',
                  'info' => {
                    'name' => 'Carlos',
                    'image' => 'https://secure.gravatar.com/avatar/57d73bec983f59e5d2ef845e1bab5876?s=300&r=g&d=https://pacdn.500px.org/userpic.png'
                  },
                  'credentials' => {
                    'token' => 'hFLzwAKp2fiAKytFzHVy3D5x7U8g5UxcgsEH2rZo',
                    'secret' => '6Kf197qbpslwUIVONJgMm7aOVe5j4572lwW5XeyA'
                  }
                }

invalid_hash = { 'provider' => '500px',
                 'uid' => '21967077',
                 'invalid'  => 'invalid_crendentials',
               }

OmniAuth.config.add_mock(:f00px, omniauth_hash)
OmniAuth.config.add_mock(:invalid, invalid_hash)
