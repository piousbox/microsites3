
Microsites3Api::Application.config.session_store :mongoid_store

MongoSessionStore.collection_name = "client_sessions"

