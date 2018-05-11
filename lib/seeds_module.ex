# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule Blog.Seeds do
  alias Blog.Repo
  alias Blog.SiteContent.Career
  alias Blog.SiteContent.Client

  def call do
    Repo.insert!(%Career{
      title: "Junior developer",
      text:
        "The same power for half the money in the end the screen on Surface is as good as the iPad, thus the iPhone is too expensive, due to Surface is the ultimate tablet, in contrast you can't upgrade a Mac, when Macs are too expensive on the other hand Retina is just a made-up Apple name.",
      active: true,
      url: "https://jobsboard.com/listing/4"
    })

    Repo.insert!(%Career{
      title: "Management dude",
      text:
        "But my sell signal stands, and I wanted to offer rational and objective clarity for that call, finally the market share of Android cannot be discounted since HTML 5 and 4G technologies will bring the advent of the network-centric mobile Internet in the beginning increasingly, in the smartphone market, barring a radical change in trend, thatâ€™s Android, to sum up if we learn one thing from Netflixâ€™s fall from grace, itâ€™s that aggregating content is no longer a viable business model.",
      active: true,
      url: "https://jobsboard.com/listing/3"
    })

    Repo.insert!(%Career{
      title: "Banana developer",
      text:
        "Gorgeous afterwards iPhone rip-offs naturally delay in getting Ice Cream Sandwich, while profit, all in all iCloud so as to user experience sucks, in the end so-called â€œiPad killerâ€, after profit. Siri is better than TellMe and Google Voice put together, nevertheless CrackBerry whose Android geek, why MacBook Air is just beautiful, so gorgeous such a Android is fragmented, because of battery life, to Apple will only get better to sum up battery drain.",
      active: true,
      url: "https://jobsboard.com/listing/2"
    })

    Repo.insert!(%Career{
      title: "International Marketing Director Controller Assistant",
      text:
        "It's OK to get Rib-grease on your face, because you're allowing people to see that you're proud of these ribs. Have you urinated? Have you drained your bladder? Are you free? Because if you havent it will only come out later. I'm giving you some information that your bodily fluids may penetrate your clothing fibre's without warning.",
      active: true,
      url: "https://jobsboard.com/listing/1"
    })

    Repo.insert!(%Client{
      name: "Space Astro",
      bio:
        "and explore … We believe in what we’re doing. Now it’s time to go. When I orbited the Earth in a spaceship, I saw for the first time how beautiful our planet is. Mankind, let us preserve and increase this beauty, and not destroy it! NASA is not about the ‘Adventure of Human Space Exploration’…We won’t be doing it just to get out there in space – we’ll be doing it because the things we learn out there will be making life better for a lot of people who won’t be able to go.",
      active: true,
      url: "https://www.spaceastro.org/"
    })

    Repo.insert!(%Client{
      name: "Important Inc.",
      bio:
        "Completely synergize resource taxing relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service.",
      active: true,
      url: "https://www.important-inc.com/"
    })

    Repo.insert!(%Client{
      name: "Skate shop west 50",
      bio:
        "Helipop Shorty's late nollie boned out 270. Rocket air nollie late pool hardware. Finger flip pool 540 helipop 180. Coffin hardware berm slappy crooked grind. Finger flip drop in skate or die soul skate frigid air. Skater Ron Chapman birdie kickflip rip grip axle set. Risers slam Kien Lieu Saran Wrap wall ride frigid air. Masonite coper g-turn pressure flip betty. Front foot impossible Memory Screen Kevin Harris skate or die switch finger flip. Hurricane downhill bruised heel hardware no comply. Griptape bearings feeble finger flip 540.",
      active: true,
      url: "https://www.skateshopwest50.com/"
    })

    alias Blog.User

    Repo.insert!(%User{
      email: "Joe.Something@example.com",
      first_name: "Joe",
      last_name: "Something",
      provider: "google",
      token: "wi4utpqvbw4otvbqpeughvbqeuilvwiuhbqvo4ty387w4",
      is_active: true
    })

    alias Blog.SiteContent.Blogpost

    Repo.insert!(%Blogpost{
      title: "qui sint ratione",
      description: "Est fuga saepe quia culpa eos.",
      slug:
        "Id alias asperiores nihil dicta odio sed reiciendis. Occaecati culpa et. Sequi optio sed eveniet. Omnis sint dolor totam hic voluptatem voluptas inventore asperiores repudiandae. Necessitatibus quibusdam quia voluptatem ducimus est vero magni. Aut rerum quo facere modi.",
      text:
        "At enim commodi ea ut a deserunt dolor. Nemo quia pariatur quasi ut voluptatem. Nisi nulla omnis dolorem omnis iste ipsum nesciunt dicta quibusdam. Earum est dolor ullam deserunt id vel ut illum laboriosam. Provident facilis ut consequatur. Officia autem sed fuga fugit quo omnis nihil quisquam beatae.
    Eaque enim autem cumque provident unde repellat sit minus vero. Voluptate quia perspiciatis sequi voluptatem assumenda qui quis aut. Rerum esse laboriosam animi. Necessitatibus quidem laudantium maiores beatae.
    Quae aut illo consectetur. Dolor amet ut ducimus perferendis enim eveniet ullam voluptatum. Labore ea et. Laudantium libero aspernatur voluptatem qui nihil nihil fugiat aut nostrum. Rerum incidunt harum molestiae. Aliquam voluptatibus rerum.",
      published: true,
      user_id: 1
    })
  end
end
