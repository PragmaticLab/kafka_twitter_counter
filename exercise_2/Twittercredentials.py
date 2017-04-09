import tweepy

consumer_key = "F0MNF5bYF3vDynrtyaWKuqxV8";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "COPfcFGEqMsHPReyLQG6OYrP0uoPA3KZjlLJkN4kf9OQNbBnz0";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2509326721-sg2zKbrffkXxGXeiAed0MdckxV8B2dV3bisTvhS";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "sMKw0CF7XnpF5rIjg3SmMdDTqNukkIa9aoszgjzYLxUqv";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



