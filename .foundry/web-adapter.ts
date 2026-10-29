/** Foundry development adapter. Safe to commit; inactive outside an explicit session. */
export async function installFoundryDesignControl(): Promise<void> {
  if (typeof window === 'undefined') return;
  const query = new URLSearchParams(window.location.search);
  if (!query.has('__foundry_session')) return;
  const adapter = await import(/* @vite-ignore */ 'http://127.0.0.1:4387/adapter.js');
  adapter.installFoundryInspector();
}
