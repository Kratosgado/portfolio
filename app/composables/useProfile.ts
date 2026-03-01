const fetchProfile = () => queryCollection('profile').first();

export function useProfile() {
  return useAsyncData('profile', fetchProfile);
}
