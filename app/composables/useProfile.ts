const fetchProfile = () => queryCollection('profile').first();

export function useProfile() {
  return useLazyAsyncData('profile', fetchProfile);
}
